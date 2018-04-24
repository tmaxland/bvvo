package bvvo.web.validator;

import org.springframework.stereotype.Component;

import org.springframework.util.StringUtils;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import bvvo.model.User;


@Component
public class UserValidator implements Validator {

    @Override
    public boolean supports( Class<?> clazz )
    {
        return User.class.isAssignableFrom( clazz );
    }

    @Override
    public void validate( Object target, Errors errors )
    {
    	User user = (User) target;

    	if( !StringUtils.hasText( user.getFirstName() ) )
    		errors.rejectValue( "username", "error.user.username.empty" );

    	if( !StringUtils.hasText( user.getPassword() ) )
    		errors.rejectValue( "password", "error.user.password.empty" );
    	
    	if( !StringUtils.hasText( user.getCity() ) )
    		errors.rejectValue( "password", "error.user.city.empty" );
    	
    	if( !StringUtils.hasText( user.getEmail() ))
    		errors.rejectValue( "password", "error.user.email.empty" );
    	
    	if( !StringUtils.hasText( user.getState() ) )
    		errors.rejectValue( "password", "error.user.state.empty" );
    	
    	if( !StringUtils.hasText( user.getStreetAddress() ) )
    		errors.rejectValue( "password", "error.user.streetAddress.empty" );
    	
    	
    }

}
