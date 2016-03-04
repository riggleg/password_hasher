require "password_hasher/version"
require 'securerandom'
require 'openssl'
require 'base64'

module PasswordHasher

  # The following constants can be changed without breaking existing hashes.
  PBKDF2_ITERATIONS = 1000
  SALT_BYTE_SIZE = 24
  HASH_BYTE_SIZE = 24

  HASH_SECTIONS = 4
  SECTION_DELIMITER = ':'
  ITERATIONS_INDEX = 1
  SALT_INDEX = 2
  HASH_INDEX = 3
  # Returns a salted PBKDF2 hash of the password.
  def self.createHash( password )
    salt = SecureRandom.base64( SALT_BYTE_SIZE )
    pbkdf2 = OpenSSL::PKCS5::pbkdf2_hmac_sha1(
                                              password,
                                              salt,
                                              PBKDF2_ITERATIONS,
                                              HASH_BYTE_SIZE
                                              )
    return ["sha1", PBKDF2_ITERATIONS, salt, Base64.encode64( pbkdf2 )].join( SECTION_DELIMITER )
  end

  # Checks if a password is correct given a hash of the correct one.
  # correctHash must be a hash string generated with createHash.
  def self.validatePassword( password, correctHash )
    params = correctHash.split( SECTION_DELIMITER )
    return false if params.length != HASH_SECTIONS

    pbkdf2 = Base64.decode64( params[HASH_INDEX] )
    testHash = OpenSSL::PKCS5::pbkdf2_hmac_sha1(
                                                password,
                                                params[SALT_INDEX],
                                                params[ITERATIONS_INDEX].to_i,
                                                pbkdf2.length
                                                )

    return pbkdf2 == testHash
  end

  def self.runSelfTests
    puts "Sample hashes:"
    3.times { puts createHash("password") }

    puts "\nRunning self tests..."
    @@allPass = true

    correctPassword = 'aaaaaaaaaa'
    wrongPassword = 'aaaaaaaaab'
    hash = createHash(correctPassword)

    assert( validatePassword( correctPassword, hash ) == true, "correct password" )
    assert( validatePassword( wrongPassword, hash ) == false, "wrong password" )

    h1 = hash.split( SECTION_DELIMITER )
    h2 = createHash( correctPassword ).split( SECTION_DELIMITER )
    assert( h1[HASH_INDEX] != h2[HASH_INDEX], "different hashes" )
    assert( h1[SALT_INDEX] != h2[SALT_INDEX], "different salt" )

    if @@allPass
      puts "*** ALL TESTS PASS ***"
    else
      puts "*** FAILURES ***"
    end

    return @@allPass
  end

  def self.assert( truth, msg )
    if truth
      puts "PASS [#{msg}]"
    else
      puts "FAIL [#{msg}]"
      @@allPass = false
    end
  end

end
