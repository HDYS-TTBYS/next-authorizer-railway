// export default {
//     authorizerURL: "https://authorizer-railway-production-5ff4.up.railway.app",
//     redirectURL: "http://localhost:3000",
//     clientID: "50855d8d-ba5f-4295-8911-066615a1796d",
// };

export default {
    authorizerURL: process.env.NEXT_PUBLIC_AUTHORIZER_URL,
    redirectURL: process.env.NEXT_PUBLIC_REDIRECT_URL,
    clientID: process.env.NEXT_PUBLIC_CLIENT_ID,
};
