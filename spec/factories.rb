require 'trello'

FactoryBot.define do
  factory :board do
    attributes Hash.new(
      id: '5cdb7f6454d72d8a82484edc',
      name: 'test',
      description: '',
      closed: false,
      starred: false,
      url: 'https://trello.com/b/u3odSYgp/test',
      organization_id: nil,
      last_activity_date: Time.new(2019, 8, 21, 06, 35, 39).utc,
      prefs: {}
    )
    lists [build(:list)]
  end

  factory :list do
    attributes Hash.new(
      id: '5cdb7f6454d72d8a82484edd', 
      name: 'To Do [5]', 
      closed: false, 
      board_id: '5cdb7f6454d72d8a82484edc', 
      pos: 16384, 
      source_list_id: nil
    )
    cards [build(:card)]
  end

  factory :card do
    attributes Hash.new(
      id: '5cdb7f798e813f369251cf80',
      short_id: 1,
      name: 'test',
      desc: 'Test card description. Here is anything related to what this card is about',
      due: nil,
      due_complete: false,
      closed: false,
      url: 'https://trello.com/c/9i8SKsNg/1-test',
      short_url: 'https://trello.com/c/9i8SKsNg',
      board_id: '5cdb7f6454d72d8a82484edc',
      member_ids: ['58be2e3dec005d3ead5de46d'],
      list_id: '5cdb7f6454d72d8a82484edd',
      pos: 65535,
      last_activity_date: Time.new(2019, 8, 21, 06, 35, 39).utc,
      labels: [build(:label)],
      card_labels: ["5d626e6334aa2b6e21b615c6"],
      cover_image_id: nil,
      badges: {
        'attachmentsByType' => {
          'trello' => { 'board' => 0, 'card' => 0 }
        },
        'location' => false,
        'votes' => 0,
        'viewingMemberVoted' => false,
        'subscribed' => true,
        'dueComplete' => false,
        'due' => nil,
        'description' => true,
        'attachments' => 0,
        'comments' => 1,
        'checkItemsChecked' => 0,
        'checkItems' => 1,
        'fogbugz' => ''
      },
      card_members: nil,
      source_card_id: nil,
      source_card_properties: nil
    )
  end

  factory :label do
    attributes Hash.new(
      id: '5d626e6334aa2b6e21b615c6', 
      name: 'Test', 
      board_id: '5cdb7f6454d72d8a82484edc', 
      uses: nil, 
      color: 'green'
    )
  end
end