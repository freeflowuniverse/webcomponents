module htmx

// see https://htmx.org/reference/
pub struct HTMX {
pub mut:
	boost      ?bool	
	get        ?string
	post       ?string
	put        ?string
	delete     ?string
	push_url   ?string
	select_    ?string
	select_oob ?string
	swap       ?string
	swap_oob   ?string
	target     ?string
	trigger    ?string
	vals       ?string
}

//
pub fn (hx HTMX) str() string {
	mut attributes := []string{}
	$for field in HTMX.fields {
		val := hx.$(field.name)
		val_str := '${val}'.all_after('Option').trim("'()")
		if val_str != '' && val_str != 'none' {
			// hack around to unwrap optional
			attributes << 'hx-${field.name.trim_string_right('_').replace('_', '-')}="${val_str}"'
		}
	}
	return attributes.join(' ')
}
