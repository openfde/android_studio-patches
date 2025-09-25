#!/bin/bash

# 设置目标目录（默认为当前目录）
TARGET_DIR="${1:-.}"

# 检查目录是否存在
if [ ! -d "$TARGET_DIR" ]; then
    echo "错误: 目录 $TARGET_DIR 不存在"
    exit 1
fi

# 统计替换次数
REPLACE_COUNT=0
FILE_COUNT=0

echo "开始替换 $TARGET_DIR 及其子目录中的文件..."

# 查找并处理所有文件
while IFS= read -r -d $'\0' file; do
    # 检查文件是否可读可写
    if [ -r "$file" ] && [ -w "$file" ]; then
        # 检查文件是否包含目标字符串
        if grep -q '\@intellij\/\/:intellij.java.featuresTrainer' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.java.featuresTrainer/\/\/prebuilts\/studio\/intellij.java.featuresTrainer/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.java.structuralSearch' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.java.structuralSearch/\/\/prebuilts\/studio\/intellij.java.structuralSearch/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.java.unscramble' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.java.unscramble/\/\/prebuilts\/studio\/intellij-sdk:intellij.java.unscramble/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.java.vcs' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.java.vcs/\/\/prebuilts\/studio\/intellij-sdk:intellij.java.vcs/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.jvm.analysis.impl' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.jvm.analysis.impl/\/\/prebuilts\/studio\/intellij-sdk:intellij.jvm.analysis.impl/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:com.jetbrains.performancePlugin' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:com.jetbrains.performancePlugin/\/\/prebuilts\/studio\/intellij-sdk:com.jetbrains.performancePlugin/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
	    if grep -q '\@intellij\/\/:intellij.libraries.grpc.netty.shaded' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.libraries.grpc.netty.shaded/\/\/prebuilts\/studio\/intellij-sdk:intellij.libraries.grpc.netty.shaded/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:Coverage' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:Coverage/\/\/prebuilts\/studio\/intellij-sdk:Coverage/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:com.intellij.platform.images' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:com.intellij.platform.images/\/\/prebuilts\/studio\/intellij-sdk:com.intellij.platform.images/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:com.intellij.java' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:com.intellij.java/\/\/prebuilts\/studio\/intellij-sdk:com.intellij.java/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:org.jetbrains.kotlin' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.kotlin/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.kotlin/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:com.intellij.gradle' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:com.intellij.gradle/\/\/prebuilts\/studio\/intellij-sdk:com.intellij.gradle/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:intellij.webp' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.webp/\/\/prebuilts\/studio\/intellij-sdk:intellij.webp/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:org.intellij.groovy' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.intellij.groovy/\/\/prebuilts\/studio\/intellij-sdk:org.intellij.groovy/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:org.toml.lang' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.toml.lang/\/\/prebuilts\/studio\/intellij-sdk:org.toml.lang/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:com.intellij.platform.images' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:com.intellij.platform.images/\/\/prebuilts\/studio\/intellij-sdk:com.intellij.platform.images/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:org.jetbrains.plugins.gradle' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.plugins.gradle/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.plugins.gradle/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:com.intellij.properties' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:com.intellij.properties/\/\/prebuilts\/studio\/intellij-sdk:com.intellij.properties/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:JUnit' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:JUnit/\/\/prebuilts\/studio\/intellij-sdk:JUnit/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:intellij.turboComplete.languages.kotlin' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.turboComplete.languages.kotlin/\/\/prebuilts\/studio\/intellij-sdk:intellij.turboComplete.languages.kotlin/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
		if grep -q '\@intellij\/\/:Git4Idea' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:Git4Idea/\/\/prebuilts\/studio\/intellij-sdk:Git4Idea/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.vcs.impl' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.vcs.impl/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.vcs.impl/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:com.intellij.modules.json' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:com.intellij.modules.json/\/\/prebuilts\/studio\/intellij-sdk:com.intellij.modules.json/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.intellij.intelliLang' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.intellij.intelliLang/\/\/prebuilts\/studio\/intellij-sdk:org.intellij.intelliLang/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.vcs.dvcs.impl' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.vcs.dvcs.impl/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.vcs.dvcs.impl/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.vcs.log.impl' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.vcs.log.impl/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.vcs.log.impl/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.lvcs.impl' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.lvcs.impl/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.lvcs.impl/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.libraries.grpc' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.libraries.grpc/\/\/prebuilts\/studio\/intellij-sdk:intellij.libraries.grpc/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.libraries.ktor.client' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.libraries.ktor.client/\/\/prebuilts\/studio\/intellij-sdk:intellij.libraries.ktor.client/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.libraries.ktor.client.cio' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.libraries.ktor.client.cio/\/\/prebuilts\/studio\/intellij-sdk:intellij.libraries.ktor.client.cio/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.libraries.microba' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.libraries.microba/\/\/prebuilts\/studio\/intellij-sdk:intellij.libraries.microba/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.libraries.skiko' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.libraries.skiko/\/\/prebuilts\/studio\/intellij-sdk:intellij.libraries.skiko/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.clouds' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.clouds/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.clouds/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.collaborationTools' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.collaborationTools/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.collaborationTools/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.compose' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.compose/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.compose/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.coverage' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.coverage/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.coverage/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.coverage.agent' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.coverage.agent/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.coverage.agent/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.debugger.impl.backend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.debugger.impl.backend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.debugger.impl.backend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.debugger.impl.frontend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.debugger.impl.frontend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.debugger.impl.frontend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.diagnostic.freezeAnalyzer' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.diagnostic.freezeAnalyzer/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.diagnostic.freezeAnalyzer/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.diagnostic.freezes' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.diagnostic.freezes/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.diagnostic.freezes/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.execution.dashboard' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.execution.dashboard/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.execution.dashboard/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.execution.serviceView' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.execution.serviceView/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.execution.serviceView/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.frontend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.frontend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.frontend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.images.backend.svg' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.images.backend.svg/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.images.backend.svg/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.images.copyrigh' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.images.copyrigh/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.images.copyrigh/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.inline.completion' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.inline.completion/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.inline.completion/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.kernel.backend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.kernel.backend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.kernel.backend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.navbar' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.navbar/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.navbar/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.navbar.backend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.navbar.backend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.navbar.backend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.navbar.frontend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.navbar.frontend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.navbar.frontend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.navbar.monolith' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.navbar.monolith/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.navbar.monolith/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.progress.backend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.progress.backend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.progress.backend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.project.backend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.project.backend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.project.backend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.rpc.backend' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.rpc.backend/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.rpc.backend/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.settings.local' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.settings.local/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.settings.local/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.smRunner.vcs' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.smRunner.vcs/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.smRunner.vcs/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.settingsSync.core' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.settingsSync.core/\/\/prebuilts\/studio\/intellij-sdk:intellij.settingsSync.core/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.smart.update' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.smart.update/\/\/prebuilts\/studio\/intellij-sdk:intellij.smart.update/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.editorconfig.editorconfigjetbrain' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.editorconfig.editorconfigjetbrain/\/\/prebuilts\/studio\/intellij-sdk:org.editorconfig.editorconfigjetbrain/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.intellij.plugins.markdown' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.intellij.plugins.markdown/\/\/prebuilts\/studio\/intellij-sdk:org.intellij.plugins.markdown/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.markdown.compose.preview' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.markdown.compose.preview/\/\/prebuilts\/studio\/intellij-sdk:intellij.markdown.compose.preview/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.idea.reposearch' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.idea.reposearch/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.idea.reposearch/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.idea.maven.model' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.idea.maven.model/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.idea.maven.model/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.idea.maven.server.api' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.idea.maven.server.api/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.idea.maven.server.api/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.debugger.streams' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.debugger.streams/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.debugger.streams/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.java.decompiler' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.java.decompiler/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.java.decompiler/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.plugins.github' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.plugins.github/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.plugins.github/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.plugins.gitlab' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.plugins.gitlab/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.plugins.gitlab/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.plugins.terminal' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.plugins.terminal/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.plugins.terminal/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.plugins.textmate' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.plugins.textmate/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.plugins.textmate/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:org.jetbrains.plugins.yaml' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:org.jetbrains.plugins.yaml/\/\/prebuilts\/studio\/intellij-sdk:org.jetbrains.plugins.yaml/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:DevKit' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:DevKit/\/\/prebuilts\/studio\/intellij-sdk:DevKit/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:HtmlTools' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:HtmlTools/\/\/prebuilts\/studio\/intellij-sdk:HtmlTools/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:TestNG-J' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:TestNG-J/\/\/prebuilts\/studio\/intellij-sdk:TestNG-J/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.images.copyright' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.images.copyright/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.images.copyright/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        if grep -q '\@intellij\/\/:intellij.platform.images.copyright' "$file"; then
            # 执行替换操作
            sed -i 's/\@intellij\/\/:intellij.platform.images.copyright/\/\/prebuilts\/studio\/intellij-sdk:intellij.platform.images.copyright/g' "$file"
            ((REPLACE_COUNT++))
            echo "已处理: $file"
        fi
        ((FILE_COUNT++))
    else
        echo "跳过不可访问文件: $file"
    fi
done < <(find "$TARGET_DIR" -type f ! -path "*/.git/*" -name "BUILD*" -print0)

# 输出结果
echo ""
echo "操作完成!"
echo "扫描文件总数: $FILE_COUNT"
echo "执行替换操作的文件数: $REPLACE_COUNT"