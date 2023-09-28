# Middleware::RubyGem

---

## Installation Steps

### Build and Install Native Gem

- Clone the repository and navigate to the root directory of repository

- Install all the required gems
  ```bash
  bundle install
  ```

- Build the native gem
  ```bash
  gem build
  ```

- Install native gem
  ```bash
  gem install middleware_apm_*.gem 
  ```

### Usage gem in ruby application

- Add the gem to Gemfile
  ```ruby
  # If the application is running in Linux environment
  gem "middleware_apm_linux"
  
  # If the application is running in Windows environment
  gem "middleware_apm_windows"
  ```

- Add below code at initialization of your application
  ```ruby
  # If the application is running in Linux environment
  require 'middleware/ruby_gem_linux'
  
  # If the application is running in Windows environment
  require 'middleware/ruby_gem_windows'

  Middleware::RubyGem.init
  ```

- Set below listed environment variables

  | Environment Variable Name   | Sample Value                     | Is required                            | Description                          |
  |-----------------------------|----------------------------------|----------------------------------------|--------------------------------------|
  | OTEL_EXPORTER_OTLP_ENDPOINT | http://localhost:9320            | Yes                                    | Endpoint to send the collected data. |
  | OTEL_SERVICE_NAME           | Demo Service Name                | No                                     | Your Service Name.                   |
  | OTEL_RESOURCE_ATTRIBUTES    | project.name="Demo Project Name" | No                                     | Your Project Name.                   |
  | MW_API_KEY                  | {Your API Key}                   | If Linux then Yes / If windows then no | It is used for profiling.            |


- Run your  application 
  - Example: If its a ruby-on-rails application
    ```bash
    rails server
    ```

#### Note: Profiling is not supported for windows application.