const { MongoClient, ServerApiVersion } = require('mongodb');
 
// Replace the following with your Atlas connection string                                                                                                                                        
const uri = "mongodb+srv://appuser:appuser123@scmongocluster.gfafb.mongodb.net/?retryWrites=true&w=majority";
const client = new MongoClient(uri, { useNewUrlParser: true, useUnifiedTopology: true, serverApi: ServerApiVersion.v1 });
client.connect(err => {
  const collection = client.db("test").collection("devices");
  // perform actions on the collection object
  client.close();
});


async function run() {
    try {
        await client.connect();
        var db = client.db("sample_airbnb");
        console.log("Connected correctly to server");
       //await db.createCollection("testCollection");
       
await db.collection("listingsAndReviews").find().forEach( function(myDoc) { print( "name: " + myDoc.name ); } );
 
    } catch (err) {
        console.log(err.stack);
    }
    finally {
        await client.close();
    }
}
run().catch(console.dir);
