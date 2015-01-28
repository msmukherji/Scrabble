require 'minitest/autorun'
require 'pry'
require 'did_you_mean'

Dict = []

f = File.open("./words.txt")
f.each { |line|
	if line.length >= 3 && line.length <= 8
		Dict << line.chomp
	end
	}
f.close

def scramble_words array

	if array.length > 8
		print "Please enter an array of size one to seven"
		return
	end
	
	scrambles = []

	limit = array.length

	index = (2..limit).to_a

	perms = []

	index.each do |i|
		perms += array.permutation(i).to_a
	end

	perms.each do |x|
		scrambles.push(x.join)
	end

	return scrambles.sort!

end


def find_words scrambles
	return scramble_words(scrambles) & Dict 
	#intersection method, instead of building a new array one by one
end



class TestAnagram <Minitest::Test

	def test_scrambler
		assert_equal scramble_words(["c","a","b"]), ["ab", "ac", "ba", "bc", "ca", "cb", "abc", "acb", "bac", "bca", "cab", "cba"].sort!
	end

	# def test_finder_nonwords
	# 	assert_equal find_words(["cab", "blegh"]), ["cab"]
	# end

	# def test_finder_with_scrambles
	# 	print find_words(["c","a","b"])
	# 	assert_equal find_words(["c","a","b"]), ["cab","ba","ca","bac"].sort!
	# end

	# def test_finder_big
	# 	print find_words(["h","o","l","e"])
	# 	assert_equal find_words(["h","e","l","l","o"]), ["eh","ell","oe","oh","he","hoe","ho","holl","hole","hello","el","hell","lo"].sort!
	# end

	# def test_singleton
	# 	assert_equal find_words(["h"]), []
	# end

	# def test_eight
	# 	print find_words(["a","b","c","d","e","f","g","h"])
	# end

	# def test_2_eight
	# 	print find_words(%w(i n s t i t u t i o n a l))
	# end

end