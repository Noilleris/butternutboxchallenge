# General

Coding challenge for ButternutBox. Implementation of a small module for phone number formatter for UK phones.

# Files

- ``formatter.rb`` - implementation
- ``test_formatter.rb`` - tests
- ``Gemfile`` - required packages

# Dependencies

minitest

# Analysis

Let us see what we could do here. We have numbers in three possible formats:

- 07XXXXXXXXX
- 447XXXXXXXXX
- +447XXXXXXXXX

I will assume there are could be a couple of other formats with `(), -` and white spaces so in worst case scenario it could look like:

- 07(XXX) XX XX XX
- +44-7XX-XXX-XX-XX
- 44(7XX)-XXX-XXXX

So the very first step we have to normalize what we working with. We will add a function to clean and prepare numbers for formatting:

```ruby
def normalize(number)
    # remove white spaces, dashes and bracers
    # return number in [X]+ format
end
```

After it has been normalized we have to validate the number:

```ruby
def validate(number)
	# number being checked against regexp to see if it is valid or not, for invalid numbers BadNumber raised
	# return number with +44 prefix
end
```

If validate function not raised an error we returning its result in the format function.

We also have to introduce three custom exceptions 

```ruby
BadNumber, NilNumber, EmptyNumber
```

# Tests

We need to cover it with next tests:

- The valid number for any format from above minimum 6 tests
- Empty value for the number
- A null value for the number
- Not a number. Example(`abcd`)
- Number too short
- Number too long
- Number in another country. Example +7(xxx)-xxx-xx-xx
- A corrupted number like `071234RR789`

# How to run

```ruby
bundle install
ruby test_formatter.rb
```

# Thoughts

I always have concerns about using regex as they are hard to maintain and read.
Number of exceptions could be increased.