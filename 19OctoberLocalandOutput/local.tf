
locals {
  common_tag= {
    app_code=var.app_code
    cost_center=var.cost_center
    environment=var.environment
    app_id=var.app_id
   
  }
   resource_group_name=var.rg_name
   st_tags={
  brand="adidas"
}

rg_tags={
  size="8UK"
}
}

