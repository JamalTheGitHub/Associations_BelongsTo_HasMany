# README
This is about associations between <strong>One to Many</strong> OR <strong>Many to One</strong>. Think of it like <strong>Twitter</strong> where a <strong>user</strong> can <strong>have many posts</strong> BUT the posts can only <strong>belongs to the user</strong>.

<h3>Step 1</h3>
<u><strong>NOTE: For this tutorial, I have created a home controller with the action index and made that my root.</strong></u>

First create a functional login.

<h3>Step 2</h3>

Next create a page that will display <strong>all the posts</strong> from <strong>all the users</strong>. To do this, just add the action <strong>show</strong> to the Home controller as well as adding <strong>get 'home/show'</strong> to the routes so that we can access that webpage. After that, go to the <strong>app/views/home/</strong> and add a file called <strong>show.html.erb</strong>.

Once that is done, just leave it. Basically we just created a skeleton page that we are going to display all the posts.

<h3>Step 3</h3>

Create a <strong>Post model</strong>. Inside the model, add the code

    belongs_to :user

Then create a posts migration file. It should look like as below;

    class CreatePosts < ActiveRecord::Migration[5.2]
      def change
        create_table :posts do |t|
          t.belongs_to :user, index: true
          t.string :comments

          t.timestamps
        end
      end
    end

A quick way of doing this is by entering in the terminal;

    rails g model Post user:belongs_to comments:string

After that, just go to the migration file and add <strong>index: true</strong> to the line where <strong>t.belongs_to :user</strong> as shown above.

Now that we have created the migration file and migrated it, we also need to create a <strong>Posts controller</strong> with the action <strong>new</strong>. When that is done, go to <strong>routes.rb</strong> and add <strong>resources :posts</strong> in the file. This will allow rails to create useful restful routes that we can use later.

Within the newly created <strong>Posts controller</strong>, inside the action <strong>new</strong>, add <strong>@post = Post.new</strong>.