```javascript
const MongoClient = require("mongodb").MongoClient;

// TODO add music collections in DB and change to music collection
// const uri ="mongodb://192.168.75.128:27017/movie";
const uri ="mongodb://localhost:27017/movie";

const client = new MongoClient(uri);
async function run() {
  try {
    
    await client.connect();
    const database = client.db('movie');
    const movies = database.collection('movies');
    console.log("database connect!!!");

    // Query for a movie that has the title 'Back to the Future'
    const query = { title: 'Star Trek' };
    const movie = await movies.findOne(query);
    console.log(movie);


  } finally {
    // Ensures that the client will close when you finish/error
    await client.close();
  }
}

run().catch(console.dir);
```



```javascript
const Album = require('../db/models/music-model');

getAllMusic = async(req, res) =>{
    Album.find({}, function(err, albums){
        if(err){
            return res
                .status(400)
                .json({success: false, err: err})
        }
        if(!albums.length){
            return res
                .status(404)
                .json({success: false, error: "No albums found"})
        }
        return res
        .status(200)
        .json({success: true, data: albums});
    });
  
}

getMusicById = async(req, res) => {
    Album.findById(req.params.id, function(err, album){
        if(err){
            return res
                .status(400)
                .json({success: false, error: err});
        }
        if(!album){
            return res
                .status(404)
                .json({success: false, error: "Album not found."})
        }
        return res
            .status(200)
            .json({success: true, data: album});
    })
}

createAlbum = async(req, res) =>{
    const body = req.body;
    if(!body){
        return res
            .status(400)
            .json({success: false, error: "You must specify album information"});
    }

    const album = new Album(body);

    if(!album){
        return res
            .status(400)
            .json({success: false, error: "Album creation failed"});
    }

    album
        .save()
        .then(() => {
            return res
                .status(201)
                .json({
                    success: true,
                    id: album._id,
                    message: "Album created."
                });
        })
        .catch(error =>{
            return res
                .status(400)
                .json({
                    error,
                    message: "Album not created"
                });
        })
}

updateAlbum = async(req, res) => {
    const body = req.body;
    if(!body){
        return res
            .status(400)
            .json({success: false, error: "You must provide some data to update."});
    }

    // find the doc 
    Album.findOne({_id: req.params.id}, (err, album)=>{

        if(err){
            return res
                .status(400)
                .json({success: false, error: err})
        }
        if(!album){
            return res
                .status(404)
                .json({success: false, error: "Album not found"})
        }
        
        // update all the info in the browser album from the body album
        album.album = body.album;
        album.artist = body.artist;
        album.year = body.year;
        album.artwork = body.artwork;
        
        album
            .save()
            .then(() => {
                return res
                    .status(200)
                    .json({
                        success: true,
                        id: album._id,
                        message: "Album updated."
                    });
            })
            .catch(error => {
                return res
                        .status(404)
                        .json({err, message: "Album not updated"})
            });
    });
}

deleteAlbum = async(req, res) =>{
    Album.findOneAndDelete({_id: req.params.id}, function(err, album){
        if(err){
            return res
                .status(400)
                .json({success: false, error: err});
        }
        if(!album){
            return res
                .status(400)
                .json({
                    success: false,
                    error : "Album not found"
                });
        }
        return res
            .status(200)
            .json({success: true, data: album});
    })
}

module.exports = {
    getAllMusic,
    getMusicById,
    createAlbum,
    updateAlbum,
    deleteAlbum
}
```

