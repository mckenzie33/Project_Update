module DpmsHelper
	include Math
	#used to create a set of graphs for the dpm to show
	#the user picks one graph for the dpm process
	def create_hash(filename)
		graphs = [] #array of all graphs
		graph = [] #array of points
		point = [] #points
		hash = {}
		noYcolumns = 0
		file = File.open(filename, 'r')
		while !file.eof?
			line = file.readline
			line = line.split(",").collect {|x| x.strip}
			noYcolumns = line.length-1
			for t in 0...noYcolumns #iterate over Y columns in row
				point[t] = [line[0].to_f, line[t+1].to_f] #get x,y1/2/3/...; save in point	
				graph.push(point[t]) #store each point in a graph
			end
			graphs.push(graph) #store graph created in graphs array
			graph = [] #clear the graph array
		end
		#graphs.length = num rows, graphs[i].length = num cols
		for i in 0...noYcolumns #for each column i
			for j in 0...graphs.length #for each row j
				hash.store(graphs[j][0][0], graphs[j][i][1]) #let x point to y1/2/3/...
			end
			graph[i] = hash
			hash = {}
		end
		file.close
		graph
	end

	#returns the last point in the hash
	#takes a hash as input 
	def getLastPoint myhash
			#sort the hash and get the x values
			dummy = myhash.keys.sort
			#save the x value of the last point 
			xval = dummy.last
			#get the y value of the last point
			yval = myhash[xval]
			return [xval, yval]
	end

	def getMaxMin(graph)
		dummy=[]
		dummy[0]=graph.values.max
		dummy[1]=graph.values.min
		dummy
	end

	#TODO: change this to two functions: getTstrain and getPstrain
	def tp_strain trial, youngs
		dummy = Hash.new
		trial.each do |key, value| 
			#change stress values first (y values)
			new_value = value * (1 + key)
			#change the strain values to tstrain values
			new_key = Math.log(1 + key)
			#change the tstrain to pstrain
			new_key = new_key - (new_value / (youngs * 1000))
			dummy.store(new_key, new_value)
		end
		dummy
	end	

	def rounder graph, precision
		adam = Hash.new
		graph.each do | key, value |
			new_key = key.round(precision)
			adam.store(new_key, value)
		end
		adam
	end

	def deriv trial
		dummy = Hash.new
		trial.sort
		puts "trial key: ", trial.keys
		keys = trial.keys
		puts "keys: ", keys
		values = trial.values
		#getting derivative minus first and last points
		for i in 1...keys.length - 2
			derivy_val = (values[i + 1] - values[i]) / (keys[i + 1] - keys[i])
			dummy.store(keys[i], derivy_val )
		end
		dummy
	end

	def intersection trial, derivative, thresh
		dummy = Hash.new
		trial.each do |key, value|
			deriv_val = 0.0
			if derivative.key?(key)
				deriv_val = derivative[key]
			end
			#compare the value in trial with deriv
			if (((value - deriv_val).abs / value) < thresh)
				dummy.store(key, value)
			end
		end
		dummy
	end
	#end
	# Returns the value of f(x)
	# f(x) = (a+x)/(b+x))^(b+x) - c/d
	def equationValue(a, b, c, d, x)
		f = ((a+x)/(b+x))**(b + x)
		f = f - (c/d)
		return f
	end

	# This is for checking that we're working with the right side of our asymptope
	# The point is to give more accurate error message
	def isLeftSideOfAsymptote(a, b, c, d)
		hasError = false

		f1 = E**(a-b)
		f2 = c/d
		
		if (f1 < f2)
			hasError = true
	    end

	    #puts "f1 = " + f1.to_s
	    #puts "c/d = " + f2.to_s
	    #puts "hasError = " + hasError.to_s

		return hasError
	end

	def solve(a, b, c, d)
		p=0.0
		q=200.0
		errorV=0.00001

		if isLeftSideOfAsymptote(a, b, c, d)
			puts "Data error:  should not produce negative eps_o."
			return nil
		end

		fp = equationValue(a, b, c, d, p)
		fq = equationValue(a, b, c, d, q)

		# This is checking if there's a root (eps_o) can be found
	    if fp > 0
	    	puts "No roots found"
	    	return nil
	    end

		# Ensure fp and fq have different signs, in order to guarantee
		# that a root will be found between them
		while !(fp * fq < 0) do
			q = q * 2
		    fq = equationValue(a, b, c, d, q)
		end
		
		midpoint = (q + p) / 2
	    fMidpoint = equationValue(a, b, c, d, midpoint)

		while !(fMidpoint.abs < errorV) do
			if fp * fMidpoint < 0
				q = midpoint
			    fq = equationValue(a, b, c, d, q)
			else
				p = midpoint
			    fp = equationValue(a, b, c, d, p)
			end

			midpoint = (q + p) / 2
			fMidpoint = equationValue(a, b, c, d, midpoint)
		end
		
	    return midpoint
	end

	#this function will return the swift coefficients
	#these are needed to create the final output
	#the output of this function is [eps_o, n, k]
	def getSwifts epsPF, epsPN, sigF, sigN
	    rtn = Array.new
	    #first get eps_o using the solver
	    eps_o = solve(epsPF, epsPN, sigF, sigN)
	    rtn << eps_o
	    #back solve for n
	    n = eps_o + epsPN
	    rtn << n
	    #back solve for k
	    k = sigF / ((eps_o + epsPF)**n)
	    rtn << k
	    rtn
	end

	#this function will remove all key/value pairs in 
	#the hash where the key is greater than xval
	#the return is a hash of only key/value pairs 
	#that satisfy this condition
	def removePastX myhash, xval
		rtn = Hash.new
		myhash.each do |key, value|
			if key < xval
				rtn.store (key, value)
			end	
		end
		rtn
	end

	#make sure that all of these values make sense
	#TODO: test the output
	def getSystemVars stress, pstress, tstress, neck, gauge, fitparam, youngs
		df = getLastPoint(pstrain)[0]
		dn = neck
		sigma_n = tstress[neck]
		laststresspoint = getLastPoint(stress)
		sigma_ef = laststresspoint[1]
		eps_en = laststresspoint[0]
		df_dn = ((E**df) * gauge) - ((E**dn) *gauge)
		eps_f = Math.log(eps_en + 1 + (df_dn/fitparam))
		sigma_f = sigma_ef * (eps_en + 1 + (df_dn/fitparam))
		eps_pf = eps_f - (sigma_f/youngs)
		return [eps_pf, neck, sigma_f, sigma_n]
		
	end
	#remove all points after the necking point
	#eps_pn = x value pstrain at necking point (this is our necking point attr)
	#df = last pstrain value (x)
	#dn = tstrain necking point (x)
	#sigma_n is tstress at necking point (y)
	#TODO separate TSTRESS and PSTRESS functions
	#sigma_ef = stress (y) at last point (normal graph)
	#eps_en = strain (x) at last point (normal graph)

	#hardstress/strain is graph after removing past necking point
	#df_dn = ((E**df) * gaugelength) - ((E**dn) *gaugelength)
	
	#eps_f = Math.log(eps_en + 1 + (df_dn)/fittingparam
	#sigma_f = sigma_ef * (eps_en + 1 + (df_dn)/fittingparam)
	#eps_pf = eps_f - (sigma_f/youngsmod)

	#plus = fittingparam*(1+(accuracy/100))
	#minus = fittingparam*(1-(accuracy/100))

	#get two sets of new values for eps_f, sigma_f, eps_pf (plus/minus)
	#solve the system of equations 3 times
	def createSwiftPoints firstX, totalpoints, currentsize, swiftsco
		#we want evenly spaced points and their corresponding swift values
		rtn = Hash.new
		#get the spacing for the x values 
		spacing = (1 - firstX) / (totalpoints - currentsize)
		for i in 0..(totalpoints - currentsize)
			#create a series of equally spaced points using swift equation as y's
			#y = k * (eps_o + x)**n
			xval = firstX + (i * spacing)
			yval = swiftsco[2] * (swiftsco[0] + xval)**swiftsco[1]
			rtn.store(xval, yval)
		end
		rtn
	end
	#create (500 - size) more points, equally spaced x's
	    #starting at the end of hardstress graph
	#use the k's, n's, eps_o's from above to get three graphs
	#use the x points generated creating the line values
	#and swifts equation for all three graphs where:
	#y = k * (eps_o + x)**n
	#join hardstress with the swift values for the final output values