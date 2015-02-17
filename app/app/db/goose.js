var MONGO_URL, mongoose;

mongoose = require('mongoose');

MONGO_URL = 'mongodb://localhost/organizations';

if (!mongoose.connection.db) {
  mongoose.connect(MONGO_URL);
}

//# sourceMappingURL=goose.js.map
