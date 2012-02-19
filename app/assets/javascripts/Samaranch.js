var Samaranch = {
	
	// Constant describing the validator
	Validate: {
		OPTIONAL: 0,
		COMPULSORY: 1,
		FUNCTION: 2
	},
	
	// Throws an exception.
	// @param type
	//   An array of Samaranch.whatever elements denoting the class & function
	// @param message
	//   The message to print out
	Exception: function(type, message) {
		throw {
			type: 'Samaranch.' + type.join('.') + 'Exception',
			message: message,
			toString: function() {
				return this.type + ': ' + this.message;
			}
		};
	},
	
	// Throws an exception.
	// @param params
	//   @subparam field
	//     The key of the field
	//   @subparam type
	//     The type of the validator.  See Samaranch.Validate for types
	//   @subparam title
	//     The title of the field
	//   @subparam validator
	//     The function validating the field if type is set to 
	//     Samaranch.Validate.FUNCTION
	Validator: function(params) {
		if (!params['field']) {
			Samaranch.Exception(['Validator', 'NoField'],
			'No field name set for validator.');
		}
		
		return {
			_type: 'Samaranch.Validator',
			field: params['field'],
			type: params['type'] || Samaranch.Validate.OPTIONAL,
			title: params['title'] || params['field'],
			validator: params['validator'] || function(field){ return true },
			
			run: function(params) {
				switch (this.type) {
					case Samaranch.Validate.OPTIONAL:
						return true;
						break;
					case Samaranch.Validate.COMPULSORY:
						return !!params[this.field];
						break;
					case Samaranch.Validate.FUNCTION:
						if (!!params[this.field]) {
							return this.validator(params[this.field]);
						}
						else {
							return this.validator(undefined);
						}
						break;
				}
			}
		};
	},
	
	// Takes:
	// original_params - full list of parameters to check against
	// new_params - list of overriding parameters
	// validator
	
	setupParams: function(original_params, new_params, validators) {
		_.each(validators, function(v, key){
			if (!v._type || v._type != 'Samaranch.Validator') {
				v['field'] = key;
				validators[key] = new Samaranch.Validator(v);
			}
		});
		
		_.each(new_params, function(p, key){
			if (!!validators[key]) {
				var ok = validators[key].run(new_params);
				if (!ok) {
					Samaranch.Exception(['validateParams'], 
					'Could not validate ' + key)
				}
			}
			original_params[key] = p;
		});
		return original_params;
	}
	
};