<div class="comment-container flex-col gap-1">
    <% if comments.any? %>
        <% comments.each do |comment| %>
            <div class="comment-card">
                <div class="comment-name" ><%= comment.user.name %></div>
                <div ><%= comment.text %></div>
            </div>
        <% end %>
    <% else %>
        <div>No comment</div>
    <% end %>
</div>

