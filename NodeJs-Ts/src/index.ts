const fullName: string = 'Dư Thanh Được'
// console.log(fullName)

const handle: () => Promise<string> = () => Promise.resolve(fullName)
handle().then(console.log)
