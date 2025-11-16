function submitForm() { 
    var name = document.getElementById('name').value; 
    var email = document.getElementById('email').value; 
    var phone = document.getElementById('phone').value; 
 
    if (name && email && phone) { 
        document.getElementById('confirmation').innerText = 
            'Thank you, ' + name + '! You have registered successfully.'; 
        console.log('Registration Details:', { Name: name, Email: email, Phone: phone }); 
    } else { 
        alert('Please fill all the fields.'); 
    } 
}