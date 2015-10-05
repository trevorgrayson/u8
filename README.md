# eval-U8 shell commands in ruby code!

Evaluate an `ls` and put it's contents (a list of files) into the files variable.

    files = U8.ls

If you want to drop the U8 namespace, you can `shell` and refer to commands directly. For instance: 

Eval an ls, then map the elements to the contents of each file.

    U8.shell do

      ls.map{|file| cat file}

    end

`U8.interactive` will allow you to run arbitrary commands, and print their results. 

Try running `rash` from the `bin` directory if you would like to try the poor man's ruby shell.
