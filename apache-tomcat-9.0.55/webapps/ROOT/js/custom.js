//Signin web was loaded already. Then belove code will be processed
$(document).ready(function(){
    // alert("Hello")
    $("#btn-signin").click(function(){
        var email = $("#email").val()
        var password = $("#password").val()
        
        console.log("email: " + email)
        console.log("password: " + password)

        $.ajax({
            method: "POST",
            url: "http://localhost:8080/login/signin",
            data: { 
                username: email, 
                password: password 
            }
        })
            .done(function( msg ) { 
                console.log(msg)       
                // if(msg.data){
                //     window.location.href = "./index.jsp"
                //     //alert("Successfull!")
                // } else {
                //     alert("Unsuccessfull!")
                // } 
            
        // .done(function( msg ) {  
        //   console.log(msg)      
        //   if(msg.success){
        //     localStorage.setItem("token", msg.data)
        //     window.location.href = "./index.jsp"
        //     //alert("Successfull!")
        //   } else {
        //     alert("Unsuccessfull!")
        //   }  
        
        
        })

  })
})