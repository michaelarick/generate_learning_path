This is an implementation of a learning path generator for espark learning.

Source files:
- student.rb - a ruby class that has the student's name and their levels in various domains. This also includes the ability to generate an array of Students from a file.
- csv_file_tokenizer.rb - a class that can read a CSV, either with headers (returning an array of hashes) or without headers (returning an array of arrays).
- learning_path_generator.rb - a class that reads in a domain order, then can generate a learning path of any size (default 5) that is appropriate for the passed-in student.
- main.rb - this will load the students, create a LearningPathGenerator, then output the learning paths for all the students. You can pass in a number to change the maximum length of the paths.

Test files:
- student_spec.rb
- csv_file_tokenizer_spec.rb
- learning_path_generator_spec.rb

To run tests:
- Call `./run_tests.sh`

To generate learning paths:
- Call `./generate_learning_paths.sh`
