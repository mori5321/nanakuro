import axios from 'axios'

export default () => {
  console.log(process.env.NANAKURO_SERVER_URL)
  return axios.create({
    baseURL: process.env.NANAKURO_SERVER_URL || 'http://localhost:2300',
    headers: {'Accept': 'application/json'}
  })
}
