# README
This is about associations between <strong>One to Many</strong> OR <strong>Many to One</strong>. Think of it like <strong>Twitter</strong> where a <strong>user</strong> can <strong>have many posts</strong> BUT the posts can only <strong>belongs to the user</strong>.

<h3>Step 1</h3>
<u><strong>NOTE: For this tutorial, I have created a <strong>Home controller</strong> with the action <strong>index<strong> and made that my root.</strong></u>

First create a functional login.

<h3>Step 2</h3>

Next create a page that will display <strong>all the posts</strong> from <strong>all the users</strong>. To do this, just add the action <strong>show</strong> to the Home controller as well as adding <strong>get 'home/show'</strong> to the routes so that we can access that webpage. After that, go to the <strong>app/views/home/</strong> and add a file called <strong>show.html.erb</strong>.

Once that is done, just leave it. Basically we just created a skeleton page that we are going to display all the posts.

<h3>Step 3</h3>

Create a <strong>Post model</strong>. Inside the model, add the code

    belongs_to :user

Afterwards, get into <strong>User model</strong> and add the following line;

    has_many :posts, dependent: :destroy

Then create a posts migration file. It should look like as below;

    class CreatePosts < ActiveRecord::Migration[5.2]
      def change
        create_table :posts do |t|
          t.references :user, foreign_key: true
          t.string :comments

          t.timestamps
        end
      end
    end

A quick way of doing this is by entering in the terminal;

    rails g model Post user:references comments:string

When all is done, migrate it. Now test it in rails console;

    Post.new

You should get the outcome of the attributes being nil and that is what we wanted. Next, assuming you have already created a <strong>user</strong> for the login, create a post for your <strong>user</strong>. First we need to understand that a <strong>user</strong> can have many <strong>posts</strong> but a <strong>post</strong> can only have <strong>1 user</strong> hence why in the <strong>Post model</strong>, we added <strong>belongs_to :user</strong> because the <strong>user</strong> is singular and in the <strong>User model</strong>, we added <strong>has_many :posts, dependent: :destroy</strong> because a <strong>User</strong> can have many <strong>posts</strong> which is plural AND <strong>dependent: :destroy</strong> simply means that the user can remove the posts if they wish so.

Now that we understand the association, we can proceed by assigning a <strong>post</strong> to the <strong>user</strong>. To do this, we can try something like;

    user = User.first
    user.posts.build(comments: "Hello")

<strong>user.posts.build(comments: "Hello")</strong> will just make the post but is not saved within the database. It just allows you to play around with the codes with no consenquences to the database. Notice that after you enter the code, you will see something like;

    <Post id: nil, user_id: 1, comments: "Hello", created_at: nil, updated_at: nil>

<strong>user_id: 1</strong> means that it is already assigned to a <strong>user</strong> with the <strong>id of 1</strong>. Now that we know it works, we can type the same thing but instead of <strong>build</strong>, we are going to replace it with <strong>create</strong>.

    user.posts.create(comments: "Hello")

<strong>user.posts.create(comments: "Hello")</strong> will create the post and save it to the database. Now if you enter <strong>Post.all</strong>, you will see it there in the database.

Once done experimenting and playing around with rails console, go to <strong>Home controller</strong> and inside the action <strong>show</strong>, add this code;

    @posts = Post.all

The reason why we added that is to be able to access all the <strong>attributes</strong> of the <strong>posts table in the database</strong> and <strong>comments</strong> is one of the attributes that we want.

Coming back to the skeleton page that we made to show all the posts in <strong>app/views/home/show.html.erb</strong>. WIthin this page, add the following code;

    <%= @posts.each do |p| %>
    <%= p.comments %> submitted by <%= p.user.first_name>
    <br/>
    <% end %>

What happens here is that rails will take all the attributes within the <strong>posts table within the database</strong> and will assign it to <strong>p</strong>. Therefore, this <strong>p</strong> can inherit all the attributes of the <strong>@posts</strong>. If you put <strong>p.comments</strong>, it will print out all the comments within the <strong>posts table in the database</strong> and we separate this by a line to not confuse ourselves hence why the code <br/>. Rails is smart enough to know that the iteration will not proceed to the next one until all relevant iterations are printed out.

In this case, <strong>p.comments</strong> will print out the first comment <strong>by id</strong> and <strong>not user_id</strong> in the <strong>posts table</strong>. Notice that we also add <strong>submitted by <%= p.user.first_name %></strong>. Because the iteration is still going, rails know that you are still talking about the first comment hence the code that we saw previously just means to print out the first name of the <strong>user</strong> who submitted the <strong>comment</strong>. Remember that <strong>posts belongs to user</strong> and that is why the <strong>user</strong> that was used in the code was singular.

Because we did not call anything else afterwards, the iteration ends and a new iteration begins. So if you have a second <strong>comment</strong> posted by a second <strong>user</strong>, it will be printed out in the order that we have specified. The iterations will keep on going until all is done.