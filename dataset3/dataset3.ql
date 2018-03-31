


#Aggregate Queries in mongo:

#Different types of owners and their counts
db.dvv223_d24.aggregate([{$group:{_id: "$V47",Total:{$sum:1}}}])

#Total of V3 group by State
db.dvv223_d24.aggregate([{$group:{_id:"$V10",Total:{$sum:"$V3"}}}])

#Total of V12 group by city and state
db.dvv223_d24.aggregate([{$group:{_id:{City:"V18",State:"$V10"},Total:{$sum:"$V12"}}}])

#Average of V4 group by Gender having race as 'White' 
db.dvv223_d24.aggregate([{$match:{V43:"White"}},{$group:{_id:"$V38",Average:{$avg:"$V4"}}}])

#SD of V8 for Department 
db.dvv223_d24.aggregate([{$group:{_id:"$V45",Standard_Deviation:{$stdDevSamp:"$V8"}}}])

#Map-reduce on V5 and V17
var mapFunction1 = function() {emit(this.V17, this.V5);};
var reduceFunction1 = function(V17,V15) {return Array.sum(V15)};
db.dvv223_d24.mapReduce(mapFunction1,reduceFunction1,{out:'map-reduce-of-Ownership'})





