# Development decisions
## .log file parsing
The bottleneck in this task appears to be the parsing of the log file. The file provided is 500 lines. The items we sort for printing to the console only total 10. Therefore the sorting part of the task represents less computational time than the parsing of the log's lines. The file parsing appeared to be the area to focus on optimising.

I initially parsed the log file with `File.readlines`. However, reading around the method revealed that it loads the entire file into memory at once. This would be memory-intensive for larger file sizes. To ensure the programme is more scalable, I refactored to a `File.open.each` implementation which reads the file line-by-line.

For each line in the log we perform a lookup to see if we have recorded a visit to that path already. A hash is used to store an index of these visits because of its fast lookup times. The hash has paths as keys, and Page objects as values. If the path has already been recorded as a key in the hash, we increment the number of visits to that path. If not yet visited, we create a new key-value pair and then increment the number of visits to that path.

For each visit added, we also push the visitor's ip address into a set. The set will reject any ip adresses that already exist within it. This allows us to record unique visitors to each path.

After parsing the log file, the index hash contains a significant number of ip addresses. Some of these will be duplicates. To conserve memory, I chose to save all the ip addresses as symbols. This means that multiple references to the same IP address will only instantiate one object. I applied the same practice to all saved paths.

The number of pages visited isn't large so sorting them is not an expensive operation.
