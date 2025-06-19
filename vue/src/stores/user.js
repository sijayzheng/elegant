import defaultAvatar from '@/assets/image/profile.jpg'
import {defineStore} from 'pinia'

import {clearToken, getToken, setToken} from '@/utils/index.js'
import {authApi} from '@/api/auth.js'

export const useUserStore = defineStore('user', () => {
  const token = ref(getToken())
  const name = ref('')
  const realName = ref('')
  const userId = ref('')
  const avatar = ref('')
  const roles = ref([]) // 用户角色编码集合 → 判断路由权限
  const permissions = ref([]) // 用户权限编码集合 → 判断按钮权限
  const reLogin = ref(true)
  const user = ref({})
  /**
   * 登录
   * @param loginParam
   */
  const login = async (loginParam) => {
    const res = await authApi.login(loginParam)
    if (res) {
      const {accessToken} = res.data
      console.log(accessToken)
      setToken(accessToken)
      return Promise.resolve()
    }
  }

  // 获取用户信息
  const getInfo = async () => {
    const res = await authApi.getUserInfo()
    if (res) {
      const data = res.data
      const user = data.user
      avatar.value = user.avatar === '' || user.avatar === null ? defaultAvatar : user.avatar
      if (data.roles && data.roles.length > 0) {
        roles.value = data.roles
        permissions.value = data.permissions
      } else {
        roles.value = ['ROLE_DEFAULT']
      }
      name.value = user.username
      realName.value = user.realName
      userId.value = user.id
      user.value = user
      return Promise.resolve(res)
    }
    return Promise.reject('获取用户信息失败')
  }

  // 注销
  const logout = async () => {
    await authApi.logout()
    roles.value = []
    permissions.value = []
    clearToken()
  }

  const setAvatar = (value) => {
    avatar.value = value
  }
  const setReLogin = (re) => {
    reLogin.value = re
  }

  return {
    user,
    userId,
    name,
    realName,
    avatar,
    roles,
    permissions,
    login,
    getInfo,
    logout,
    setAvatar,
    reLogin,
    setReLogin,
  }
})

export default useUserStore

// 非setup
// export function useUserStoreHook() {
//   return useUserStore(store)
// }
