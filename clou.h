#ifndef CLOU_H_
#define CLOU_H_

#define clou_secret_name(name) __clou_secret_##name
#define clou_secret_param(ty, name) const ty *clou_secret_name(name)
#define clou_declare_local(ty, name) ty name = *clou_secret_name(name) // TODO: rename to clou_declare_deref
#define clou_wrapper_name(name) __clou_wrapper_##name
#define clou_save(ty, val) ty clou_wrapper_name(val) = (val)

#define clou_public(expr) __builtin_annotation((expr), "public")

#endif
