// app/assets/javascripts/application.js
document.addEventListener('DOMContentLoaded', function () {
    var flipButtons = document.querySelectorAll('.btn-flip');
    var continueButton = document.querySelector('.btn-continue');
    var table = document.querySelector('table');
  
    flipButtons.forEach(function (button) {
      button.addEventListener('click', function () {
        var row = button.closest('tr');
        var translation = row.querySelector('td:last-child').textContent;
        row.innerHTML = `
          <td colspan="3">${translation}</td>
        `;
        continueButton.style.display = 'block';
      });
    });
  
    continueButton.addEventListener('click', function () {
      table.innerHTML = `
        <tr>
          <th colspan="3">Добре</th>
        </tr>
        <% @words.each do |word| %>
          <tr>
            <td><%= word.word_en %></td>
            <td><%= link_to 'Flip', '#', class: 'btn-flip', data: { translation: word.translation_uk } %></td>
          </tr>
        <% end %>
      `;
      continueButton.style.display = 'none';
    });
  });
  