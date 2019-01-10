# README
This is about associations between <strong>One to Many</strong> OR <strong>Many to One</strong>. Think of it like <strong>Twitter</strong> where a <strong>user</strong> can <strong>have many posts</strong> BUT the posts can only <strong>belongs to the user</strong>.

<h3>Step 1</h3>
<u><strong>NOTE: For this tutorial, I have created a home controller with the action index and made that my root.</strong></u>

First create a functional login.

<h3>Step 2</h3>

Next create a page that will display <strong>all the posts</strong> from <strong>all the users</strong>. To do this, just add the action <strong>show</strong> to the Home controller as well as adding <strong>get 'home/show'</strong> to the routes so that we can access that webpage. After that, go to the <strong>app/views/home/</strong> and add a file called <strong>show.html.erb</strong>.

Once that is done, just leave it. Basically we just created a skeleton page that we are going to display all the posts.

<h3>Step 3</h3>

Creating the posts migration file that belongs to the user.