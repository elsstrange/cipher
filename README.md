# CIPHER
This is the latest stage in a multi-step exercise I worked on during my application process for Makers Academy, and during the start of the course.
Earlier stages of the project were worked on in repl.it and documented via Gists.

The cipher exercise involves developing a simple substitution cipher, first with functions, then adopting classes and modularity.
At the current stage, the task was to make the code executable from the command line via a bash script, outputting to files with specified extensions.

## Reflections on 13 July 2020 (commit d643f00)
* Practiced chmod, and learned that to execute a script from within another script, all users must have permissions to execute it (chmod a+x or chmod 755). Also learned what the chmod numerical codes mean.
* Learned about error handling (begin/rescue/ensure) in Ruby.
* Practised bash scripting.
* Learned about ARGV in ruby and $@ in bash. Learned how to manipulate these and pass them.
* Attention to detail! A silly error in typing the wrong file name from two similar options meant that I was chasing errors that weren't really there.
* Because I worked on this in stages backwards from my ruby script, I've double-built some error handling across cipher.sh and use_cipher.rb - in reality most of the stuff in use_cipher.rb ended up being redundant.


### Possible next steps
* Omit the bash script and try running everything through use_cipher.rb and still making the desired files.
* I could also implement making cipher into a command (i.e. setting it up in bin, or pointing from bin to the script) - I did read around this but didn't try it yet.
* Tidy up and improve error handling

### Areas for development
It would be good to explore more the balance to strike in error handling. 
I'm familiar with the pythonic principle that "it's easier to ask forgiveness than permission", but I have something of an instinct for expecting end-user error and planning quite heavy-handed management of it.
I'd like to develop a thought-framework for deciding when error-handling is needed, and how involved that error-handling should be.
