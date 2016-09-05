# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class # class Proc
my_proc.call # arguments are not mandatory with procs. If not entered, it returns nil
my_proc.call('cat')

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}" }
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
puts my_lambda
puts my_second_lambda
puts my_lambda.class # lambda is an instance of Proc
my_lambda.call('dog')
# my_lambda.call # when lambda expect arguments, arguments are mandatory, like in methods
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" } lambda isn't a class, but an instance of Proc

# Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal') # Method expects block because of yield keyword
system('clear')

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
# block_method_2('turtle') { puts "This is a #{animal}."} # variable doesn't exist in block's scope
system('clear')
def ytmnd(name = "dog")
	puts "you're the man now #{name}"
end

student = lambda(&method(:ytmnd))

p student