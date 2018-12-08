# ssTaker



A simple bash Script that takes a file with domains as input.

tries to capture screenshot of it using [cutycapt](http://cutycapt.sourceforge.net/) 
and then generate a simple html report file.


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

The urls list file should be without protocol, thanks [Sahil](https://twitter.com/IsrSahilMk) for pointing this out.

``` 
>> cat urls
example.com
yahoo.com
```



## update
Added -f file and -p ports flags as requested by [Streaak](https://twitter.com/streaak)
you can check the [Sample Report](https://bugbaba.github.io/ssTaker/Dec-Sat-09-41/report.html)




Do let me know if you have any ideas for this, also do check v2 branch of this repository :)

You can reach me via [Twitter](https://twitter.com/nomanAli181)
