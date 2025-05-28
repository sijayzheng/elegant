import request from '@/utils/request.js'

export const authApi = {
  login: (data) => {
    return request({
      url: '/auth/login',
      method: 'post',
      data
    })
  },
  logout: () => {
    return request({
      url: '/auth/logout',
      method: 'post'
    })
  },
  getUserInfo: () => {
    return request({
      url: '/auth/userinfo',
      method: 'get'
    })
  },
  getCaptchaCode: () => {
    return request({
      url: '/auth/code',
      method: 'get'
    })
  },
}
