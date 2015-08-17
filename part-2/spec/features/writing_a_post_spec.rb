require_relative "../spec_helper"

feature "writing a new post" do
  background(:each) do
    @previous_post = create(:post)
  end

  context "without javascript" do
    scenario "user fills in the post form, submits it, and sees the post", { js: false } do
      visit "/"
      expect(page).to have_content "Share Anything"
      expect(page).to have_content @previous_post.title

      expect(page).to have_content "Share Your Thoughts"
      within("#post_form") do
        fill_in "post[title]", with: "Bright Idea"
        fill_in "post[author_name]", with: "Evelyn"
        fill_in "post[body]", with: "I've been doing a lot of thinking ..."
        find("input[name='submit']").click
      end

      expect(page).to have_content "The Post ..."
      expect(page).to have_content "Bright Idea"
      expect(page).to have_content "Evelyn"
      expect(page).to have_content "I've been doing a lot of thinking ..."
      expect(page).to have_content "0 likes"
    end

    scenario "user clicks on the like button and the likes on that post increase" do
      visit "/"
      expect(page).to have_content "Share Anything"
      expect(page).to have_content "Share Your Thoughts"
      expect(page).to have_content @previous_post.title

      find(".post:first-child .post_like_button").click
      expect(page).to_not have_content("Share Your Thoughts")
      expect(page).to have_content "The Post ..."
      expect(page).to have_content @previous_post.title
      expect(page).to have_content @previous_post.author_name
      expect(page).to have_content "1 likes"
    end
  end

  context "with javascript" do
    scenario "user fills in the post form, submits it, and sees the post", { js: true } do
      visit "/"
      expect(page).to have_content "Share Anything"
      expect(page).to have_content @previous_post.title

      # Fill in the form
      within("#post_form") do
        fill_in "post[title]", with: "Bright Idea"
        fill_in "post[author_name]", with: "Evelyn"
        fill_in "post[body]", with: "I've been doing a lot of thinking ..."
      end

      # Submit the form
      find("input[name='submit']").click

      # Submitting the form stays on the page
      expect(page).to have_content(@previous_post.title), "Submitting the form should not navigate to a new page."
      # New post is added to the DOM
      expect(page).to have_content("Bright Idea"), "The new post should be added to the page."
      expect(page).to have_content("Evelyn"), "The new post should be added to the page."
      expect(page).to have_content("I've been doing a lot of thinking ..."), "The new post should be added to the page."
      # Don't render the posts/show template
      expect(page).to_not have_content("The Post ..."), "Just the new post should be added to the page."
    end

    scenario "user clicks on the like button and the likes on that post increase", { js: true } do
      visit "/"
      expect(page).to have_content "Share Anything"
      expect(page).to have_content "Share Your Thoughts"
      expect(page).to have_content @previous_post.title

      find("#posts article:first-child").find(".post_like_button").click
      expect(page).to_not have_content("The Post ..."), "Clicking the 'like' button should not navigate to a new page."
      expect(page).to have_content @previous_post.title
      expect(page).to have_content "1 likes"
    end
  end
end
