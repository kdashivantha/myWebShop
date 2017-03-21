# myWebShop
asp.net mvc5 testing apps


Here i will demonstrate full stack asp.net mvc, web API, WCF apps alltogether


# DAL:

1. Set up the database (Code First development)

  Enable-Migrations
 
  Add-Migration Init
 
  Update-Database

use Identity2 auth providers, seed db and add sample users with roles

    using Microsoft.AspNet.Identity.EntityFramework;
    using Microsoft.AspNet.Identity;
    using Models;

            var roleStore = new RoleStore<IdentityRole>(context);
            var roleManager = new RoleManager<IdentityRole>(roleStore);
            var userStore = new UserStore<ApplicationUser>(context);
            var userManager = new UserManager<ApplicationUser>(userStore);
            var user = new ApplicationUser { UserName = "admin@gmail.com" };
            var guestUser = new ApplicationUser { UserName = "guest@guest.com" };

            userManager.Create(user, "abc123"); //strong password!#@$!
            userManager.Create(guestUser, "guest1"); //strong password!#@$!

            roleManager.Create(new IdentityRole { Name = "Admin" });
            userManager.AddToRole(user.Id, "Admin");




Add Domain models extends from BaseEntity

2. Add database configuration using Fluent API

EF fluent API , use to add db constrains

3. Add custom validation configuration using FluentValidation

Install-package FluentValidation , for input validations

https://chsakell.com/2015/01/17/web-api-powerful-custom-model-validation-with-fluentvalidation/

in WebApi - DTO classes add, and Static methods for automapping "toEntity()" n "toDto()"



