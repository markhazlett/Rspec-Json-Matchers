== Rspec JSON Matchers

=== Usage for key

```ruby
get '/anyPath/'

response.should have_json_key(:success)
```

=== Usage for value

```ruby
get '/anyPath/'

response.should have_json_key(:success).with_value(true)
```