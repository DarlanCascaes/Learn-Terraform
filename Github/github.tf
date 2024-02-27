terraform{
    required_providers {
      github = {
        source = "integrations/github"
        version = "6.0.0"
      }
    }
}

provider "github"{
    token = "ef7f693d4b5c498362645bebbe8353cb0589d24e"
}