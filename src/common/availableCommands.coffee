availableCommands = [
  {
    command: 'add meeting',
    description: 'Adds a meeting',
    example: '@agendabot: add meeting Developer Meeting'
  },
  {
    command: 'remove meeting',
    description: 'Removes a meeting and clears the agenda',
    example: '@agendabot remove meeting Developer Meeting'
  },
  {
    command: 'get meetings',
    description: 'Displays the names of all meetings',
    example: '@agendabot: get meetings'
  },
  {
    command: 'add agenda',
    description: 'Adds an agenda item to a meeting',
    example: '@agendabot: add agenda Define doughnut API
    to meeting Developer Meeting'
  },
  {
    command: 'clear agenda',
    description: 'Removes all agenda items for a meeting',
    example: '@agendabot: clear agenda Developer Meeting'
  },
  {
    command: 'get agenda',
    description: 'Displays the agenda for a meeting',
    example: '@agendabot: get agenda Developer Meeting'
  },
  {
    command: 'get agendas',
    description: 'Displays the agenda for all meetings',
    example: '@agendabot: get agendas'
  }
]

module.exports = availableCommands
