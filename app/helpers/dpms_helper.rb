module DpmsHelper
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
				point[t] = [line[0], line[t+1]] #get x,y1/2/3/...; save in point
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
end
