# ssTaker



A simple bash Script that takes a file with urls as input.

tries to capture screenshot of it using [cutycapt](http://cutycapt.sourceforge.net/) 
and then generate a simple html report file


#### I wrote this as [EyeWitness](https://github.com/ChrisTruncer/EyeWitness) doesn't work on **parrot os** And I am not a kali fan  



### Usage :
```
             .--.         .--.
                 \       /
          |\      `\___/'       /|
           \\    .-'@ @`-.     //
           ||  .'_________`.  ||
            \\.'^    Y    ^`.//
            .'       |       `.
           :         |         :
          :          |          :
          :          |          :
          :     _    |    _     :
          :.   (_)   |   (_)    :
        __::.        |          :__
       /.--::.       |         :--.\
    __//'   `::.     |       .'   `\\___
   `--'     //`::.   |     .'\\     `--'
            ||  `-.__|__.-'   ||
            ||                ||
            //                \\
           |/                  \|
         ssTaker By @nomanAli181


Usage: ./ssTaker.sh [options]

./ssTaker.sh file.txt                    -> Screenshot of domains in file.txt
./ssTaker.sh -f file.txt                -> Screenshot of domains in file.txt
./ssTaker.sh -h                          -> Print this help message
./ssTaker.sh -f file.txt -p 80,443       -> Screenshot of domains in file.txt on specified ports

```

The urls list file should be without protocol 
That is it should look like this 

``` 
>> cat urls
example.com
yahoo.com
```



##### Thanks [Sahil](https://twitter.com/IsrSahilMk) For pointing this out





Do let me know if you know how can we make it fast :)

You can reach me on [Twitter](https://twitter.com/nomanAli181)
And Read my [Blog](https://bugbaba.blogspot.com)
