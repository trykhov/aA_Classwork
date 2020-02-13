class View {
  constructor(game, $el) {
    this.game = game;
    this.container = $el;
    this.setupBoard();
  }

  bindEvents() {
    $('ul').on('click', (e) => {
      this.makeMove($(e.target)); // make a move first
      if(this.game.isOver()) { // see if it's over as a result of the move just made
        const winner = this.game.winner();
        $('figure').append(`<figcaption>You Win, ${winner.toUpperCase()}!</figcaption>`);
        const $winner = $('figure').addClass(`winner-${winner} game-over`);
        $('ul').off('click'); // turns off the click
      }
    });
  }

  makeMove($square) {
    let pos = $square.data('pos').split(",").map(num => Number(num));
    const currentPlayer = this.game.currentPlayer;
    try { 
      this.game.playMove(pos);
      $square.html(currentPlayer);
      $square.toggleClass(`${currentPlayer}`);
    } catch(err) {
      alert('Invalid move! Try again.');
    }
  }

  setupBoard() {
    //setting up the grid
    this.container.append('<ul></ul>');
    this.container.find('ul').addClass('grid');

    const $grid = $('.grid');
    let row = 0;
    let col = 0;

    for(let i = 0; i < 9; i++) {
      const $li = $('<li></li>');
      $grid.append($li);
      $li.attr('data-pos', [row, col]);
      if(col === 2) {
        row += 1;
        col = 0;
      } else {
        col += 1;
      }     
    }
  }
}

module.exports = View;
