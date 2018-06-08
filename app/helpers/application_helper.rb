module ApplicationHelper
	def datepicker_field(form, field)
		form.text_field(field, data: {provide: "datepicker", 
		'date-format': 'yyyy-mm-dd',
		'date-autoclose': 'true',
		'date-today-btn': 'linked',
		'date-today-hightlight': 'true'}).html_safe
	end

end
