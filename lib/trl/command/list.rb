require_relative '../trello_api'

module TRL; module Command
  class List
    def initialize(args)
      @board_name, @list_name, @card_name = args&.split('/')
      @trello_boards = Trello::Board.all
    end

    def execute
      if board_name && list_name && card_name
        trello_card.attributes[:desc]
      elsif board_name && list_name
        trello_list.cards.map(&name)
      elsif board_name
        trello_board.lists.map(&name)
      else
        trello_boards.map(&name)
      end
    end

    private

    attr_reader :board_name, :list_name, :card_name, :trello_boards

    def trello_board
      trello_boards.detect(&attribute(board_name))
    end

    def trello_list
      trello_board.lists.detect(&attribute(list_name))
    end

    def trello_card
      trello_list.cards.detect(&attribute(card_name))
    end

    def name
      -> (trello_resource) { trello_resource.attributes[:name] }
    end

    def attribute(name)
      -> (trello_resource) { trello_resource.attributes[:name].downcase == name.downcase }
    end
  end
end; end