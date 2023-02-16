module Patch
  class Project
    def initialize(api_key : String)
      @client = Patch::Client.new(api_key).reset_client
    end

    def list_projects(technology_type : String)
      @client.get("/v1/projects?type=#{technology_type}")
    end

    def get_project(project_slug : String)
      @client.get("/v1/projects/#{project_slug}")
    end

    def list_technology_types
      @client.get("/v1/projects/technology_types")
    end
  end
end
