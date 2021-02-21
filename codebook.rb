class Codebook
# Received a text file with a comma.....

  attr_reader :codebook
  def initialize(txt_file)
    @codebook = make_codebook(txt_file)
    # Would it be useful to document if the Codebook was for a LL or LN cipher?
  end

  private
  def read_char_set_file(txt_file)
    # Reads a txt file with UTF-8 encoding and returns an array of arrays, where each array contains a plaintext character and cipher character pair as strings.
    File.readlines(txt_file, encoding:"UTF-8", chomp: true)
    .map {|line| line.split(", ")}
    # Include some validation?
    # Check file type? Find out if it matters for .txt, no extenseion and .csv?
    # If line include ", " then split, else break and return error re: format?
  end

  def make_codebook(txt_file)
    # Converts an array of arrays (where each array is a pair of strings) into a hash, in which the plaintext character can be looked up to return the cipher character. 
    # Does not convert strings into other classes.
    read_char_set_file(txt_file)
    .map {|code_pair| [code_pair[0],code_pair[1]]}
    .to_h
  end
end