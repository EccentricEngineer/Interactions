import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { channelId: Number }
  static targets = ["messages"]

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChannelChannel", id: this.channelIdValue },
      { received: data => this.#insertMessageAndScroll(data) }
    )
  }


  #insertMessageAndScroll(data) {
    // adds the message into the dom
    this.messagesTarget.insertAdjacentHTML("beforeend", data)
    // scrolls down
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  resetForm(event){
    // resets the form for the sender only!
    event.target.reset()
  }

  disconnect() {
    console.log(`Unsubscribed from Channel ${this.channelIdValue}`)
    this.channel.unsubscribe()
  }


}
