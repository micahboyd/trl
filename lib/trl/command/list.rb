require_relative '../trello_api'

module TRL; module Command
  class List
    def initialize(args)
      @board, @list, @card = args&.split('/')
      @trello_boards = Trello::Board.all
    end

    def execute
      if card
        trello_card.attributes[:desc]
      elsif list
        trello_list.cards.map.with_index(&name)
      elsif board
        trello_board.lists.map.with_index(&name)
      else
        trello_boards.map.with_index(&name)
      end
    end

    private

    attr_reader :board, :list, :card, :trello_boards

    def trello_board
      get_trello(board, from: trello_boards)
    end

    def trello_list
      get_trello(list, from: trello_board.lists)
    end

    def trello_card
      get_trello(card, from: trello_list.cards)
    end

    def get_trello(item, from:)
      index?(item) ? from[item.to_i] : from.detect(&attribute(item))
    end

    def index?(string)
      string.to_i.to_s == string
    end

    def name
      -> (trello_resource, index) { "[#{index}] #{trello_resource.attributes[:name]}" }
    end

    def attribute(name)
      -> (trello_resource) { trello_resource.attributes[:name].downcase == name.downcase }
    end
  end
end; end