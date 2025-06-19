<template>
  <el-form ref="loginFormRef" :model="formData" :rules="rules" status-icon style="max-width: 400px">
    <el-form-item prop="module">
      <el-select v-model="formData.module" multiple placeholder="系统模块">
        <el-option :value="1" label="one"/>
        <el-option :value="2" label="two"/>
      </el-select>
    </el-form-item>
    <el-form-item prop="username">
      <el-input v-model="formData.username"/>
    </el-form-item>
    <el-form-item prop="password">
      <el-input v-model="formData.password" show-password type="password"/>
    </el-form-item>
    <el-form-item prop="rememberMe">
      <el-checkbox v-model="formData.rememberMe" label="记住我"></el-checkbox>
    </el-form-item>
    <el-form-item>
      <el-button :loading="loading" type="primary" @click="submitForm()">
        登录
      </el-button>
    </el-form-item>
  </el-form>
</template>

<script setup>

import {useRoute, useRouter} from 'vue-router'
import useUserStore from '@/stores/user.js'

const loginFormRef = ref()
const loading = ref(false)
const formData = ref({
  module: 1,
  username: 'admin',
  password: '123456',
  rememberMe: false,
})
const rules = reactive({
  username: [
    {
      required: true,
      message: '账号不可为空',
      trigger: 'blur'
    },
    {
      max: 30,
      message: '账号最大长度为30',
      trigger: 'blur'
    },
  ],
  password: [
    {
      required: true,
      message: '账号不可为空',
      trigger: 'blur'
    },
  ],
})
const route = useRoute()
const router = useRouter()

function submitForm() {
  loginFormRef.value?.validate((valid) => {
    if (valid) {
      useUserStore().login(formData.value).then(() => {
        const path = route.fullPath.split('?redirect=')[1] || '/'
        router.replace(decodeURIComponent(path))
      })
    }
  })
}
</script>
