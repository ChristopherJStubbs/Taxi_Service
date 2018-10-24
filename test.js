// Lives in taxi service

var taxi = {seats: 2, rider_list: []}
var rider_queue = ["Chris", "Andy", "Willy"]
function assignTaxi(taxi) {
  for (let i=0; i < taxi.seats; i++) {
    taxi.rider_list.push(rider_queue.splice(0, 1))
  }
  return taxi
}

console.log(assignTaxi(taxi));
console.log(rider_queue);

//takes in a taxi
//takes name off rider_queue and put them onto specific taxi rider_list until seats are full
