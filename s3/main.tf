resource "aws_s3_bucket" "main" {
  bucket                = var.bucket_name
  force_destroy         = var.force_destroy
  object_lock_configuration {
    object_lock_enabled = var.object_lock_enabled
    rule {
      default_retention {
        mode = var.mode
        days = var.days
      }
    }
  }
  #NOTE: acl conflicts with acces_control_policy

  #acl                   = var.acl 

#   dynamic "access_control_policy" {
#     for_each = length(var.grants) > 0 ? [true] : []

#     content {
#       dynamic "grant" {
#         for_each = var.grants

#         content {
#           permission = grant.value.permission
#           grantee {
#             type          = grant.value.type
#             id            = try(grant.value.id, null)
#             uri           = try(grant.value.uri, null)
#             email_address = try(grant.value.email, null)
#           }
#         }
#       }

#       owner {
#         id           = var.owner_id
#         display_name = var.display_name
#       }
#     }
#   }

  versioning_configuration {
    enabled = var.versioning_enabled
  }
  server_side_encryption_configuration {
    dynamic rule {
        for_each = var.rule
        content {
          dynamic apply_server_side_encryption_by_default {
            for_each = rule.value.apply_server_side_encryption_by_default
            content {
              sse_algorithm  = apply_server_side_encryption_by_default.value.sse_algorithm
        }
      }
    }
  }
 }
  dynamic "cors_rule" {
    for_each = var.cors_rules

    content {
      id              = try(cors_rule.value.id, null)
      allowed_methods = cors_rule.value.allowed_methods
      allowed_origins = cors_rule.value.allowed_origins
      allowed_headers = try(cors_rule.value.allowed_headers, null)
      expose_headers  = try(cors_rule.value.expose_headers, null)
      max_age_seconds = try(cors_rule.value.max_age_seconds, null)
    }
  }
 
   dynamic "tiering" {
    for_each = var.tiering

    content {
      access_tier = tiering.value.access_tier
      days        = tiering.value.days
    }
  }
  tags = var.tags
}