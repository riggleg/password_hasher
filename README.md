
## Installation

Add this line to your application's Gemfile:

```ruby
gem 'password_hasher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install password_hasher

## Usage

```ruby
password = "goodpass"
hashed_password = PasswordHasher.hash_password(password)
#hashed_password == something like "sha1:1000:9NYDQj80ksetV+0uW/6VAJwXKTGDqKyv:SnRzqabSk/Kpmb9C109NIv+zbHArz4kg"
validated = PasswordHasher.validate_password(password, hashed_password)
#validated == true
```

PasswordHasher will automatically add salt and the number of iterations and return those values in the string.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/riggleg/password_hasher.


## License

Password Hashing With PBKDF2 (http://crackstation.net/hashing-security.htm).
Copyright (c) 2013, Taylor Hornby
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation 
and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


