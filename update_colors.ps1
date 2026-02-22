# PowerShell script to update colors in HTML files
$files = @('services.html', 'service.html', 'blog.html', 'post.html')

foreach ($file in $files) {
    $path = "e:\College\5th Year\Sem2\Training\Assignments\Assignment_2\DuraMarble_GridsApps\$file"
    $content = Get-Content $path -Raw
    
    # Add Tailwind config
    $content = $content -replace '(<script src="https://cdn.tailwindcss.com"></script>)', '$1`n    <script>`n      tailwind.config = {`n        theme: {`n          extend: {`n            colors: {`n              cream: ''#DCD7C9'',`n              tan: ''#A27B5C'',`n              sage: ''#3F4F44'',`n              forest: ''#2C3930''`n            }`n          }`n        }`n      }`n    </script>'
    
    # Body background
    $content = $content -replace '<body class="bg-gray-50">', '<body style="background-color: #DCD7C9;">'
    
    # Navigation
    $content = $content -replace '<nav class="bg-white shadow-md">', '<nav class="shadow-md" style="background-color: #DCD7C9;">'
    $content = $content -replace '<h1 class="text-2xl font-bold text-gray-800">DuraMarble</h1>', '<h1 class="text-2xl font-bold" style="color: #2C3930;">DuraMarble</h1>'
   
    # Hero
    $content = $content -replace 'class="bg-gradient-to-r from-gray-800 to-gray-600 text-white py-16"', 'class="text-white py-16" style="background: linear-gradient(to right, #2C3930, #3F4F44);"'
    
    # Footer
    $content = $content -replace '<footer class="bg-gray-800 text-white py-8">', '<footer class="text-white py-8" style="background-color: #2C3930;">'
    
    # Service sections background
    $content = $content -replace 'class="bg-white py-16"', 'class="py-16" style="background-color: white;"'
    
    $content | Set-Content $path -NoNewline
    Write-Host "Updated $file"
}

Write-Host "Color update complete!"
