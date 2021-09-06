TABLE users {
    id SERIAL [pk]
    role_id int [ref: > roles.id]
    email TEXT [not null, unique]
    password TEXT [not null]
    phone TEXT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE reservations {
    id SERIAL [pk]
    user_id int [ref: > users.id]
    hospital_id int [ref: > hospitals.id]
    bed_type_id int [ref: > bed_types.id]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE roles {
    id SERIAL [pk]
    name TEXT [not null]
    code TEXT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE admins {
    id SERIAL [pk]
    role_id int [ref: > roles.id]
    hospital_id int [ref: > hospitals.id]
    email TEXT [not null, unique]
    password TEXT [not null]
    phone TEXT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE hospitals {
    id SERIAL [pk]
    city_id int [ref: > cities.id]
    name TEXT [not null]
    address TEXT [not null]
    phone TEXT [not null]
    bed_available INT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE notifications {
    id SERIAL [pk]
    user_id int [ref: > users.id]
    code TEXT [not null]
    details TEXT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE bed_types {
    id SERIAL [pk]
    name TEXT [not null]
    bed_available INT [not null]
    bed_empty INT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE payments {
    id SERIAL [pk]
    user_id int [ref: > users.id]
    payment_method_id int [ref: > payment_methods.id]
    reservation_id int [ref: - reservations.id]
    amount numeric [not null]
    date TIMESTAMP [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE payment_methods {
    id SERIAL [pk]
    code TEXT [not null, unique]
    name TEXT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE provinces {
    id SERIAL [pk]
    code TEXT [not null, unique]
    name TEXT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}

TABLE cities {
    id SERIAL [pk]
    province_id int [ref: > provinces.id]
    code TEXT [not null, unique]
    name TEXT [not null]
    created_at TIMESTAMP [default: `now()`]
	  updated_at TIMESTAMP [default: `now()`]
	  deleted_at TIMESTAMP
}