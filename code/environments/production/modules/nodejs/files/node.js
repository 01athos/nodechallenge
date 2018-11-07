var backup = require('backup');

/*
    Backup directory to file

    @directory {String}
    @filename {String},
    @complete {Function} :: optional, param: @err {Error}, @filename {String}
    @filter {Function} :: optional, param: @path {String} return TRUE | FALSE, if FALSE file or directory will be skipped
*/
backup.backup('/root/', '/home/ubuntu/lynxapp.backup');

/*
    Restore from file

    @filename {String},
    @directory {String}
    @complete {Function} :: optional, param: @err {Error}, @path {String}
    @filter {Function} :: optional, param: @path {String} return TRUE | FALSE, if FALSE file or directory will be skipped
*/
backup.restore('/home/ubuntu/lynxapp.backup', '/root/');
